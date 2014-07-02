<?php 
class ControllerTeilHome extends Controller { 
 
    public function index() {
        $this->load->model('teil/home');
        
        $this->template = 'teil/home.tpl';
        
        // If form submited
        if ($this->request->server['REQUEST_METHOD'] == 'POST' 
            && !empty($_SERVER['HTTP_X_REQUESTED_WITH']) 
            && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest')
        {
            // Perform some type of action
        }
        
        // DOM elements
        $this->document->setTitle('Hello, world');
        
        // Breadcrumbs
        $this->data['breadcrumbs'] = array();
        $this->data['breadcrumbs'][] = array(
            'text' => 'Главная',
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
            'text' => 'Teil',
            'href' => $this->url->link('teil/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        
        // Success and warning
        $this->getActionStatuses();

        $this->data['token'] = $this->session->data['token'];

        // Render
        $this->children = array(
            'common/header',
            'common/footer'
        );
        
        $this->response->setOutput($this->render());
	}


    /*
     * Get success and warning statuses
     */
    private function getActionStatuses()
    {
        // Success
        if (isset($this->session->data['success']))
        {
            $this->data['success'] = $this->session->data['success'];
            $this->session->data['success'] = '';
        }
        else
        {
            $this->data['success'] = '';
        }
        
        // Warning
        if (isset($this->session->data['warning']))
        {
            $this->data['warning'] = $this->session->data['warning'];
            $this->session->data['warning'] = '';
        }
        else
        {
            $this->data['warning'] = '';
        }
    }


    /**
     * Download and install new module
     *
     * @return void
     */
    public function install()
    {
        $result = array(
            'status' => true
        );

        $module_name = $this->request->post['module_name'];

        $loader = new TeilDownloader($module_name);
        
        // Close write session
        // We do this to bring user of getting download progress on air
        // If not ---> user cant watch download progress at all
        session_write_close();

        // try
        // {
            $loader->load(
                function($module_name, $filename, $dir) 
                {
                    $moduleInstaller = new ModuleInstaller(
                        $this->db,
                        $module_name,
                        $filename,
                        $dir
                    );

                    $moduleInstaller->unzip();
                    $moduleInstaller->boot();
                }
            );
        // }
        // catch (Exception $e)
        // {
        //     $result['status'] = false;
        // }

        echo json_encode($result); die();
    }


    /**
     * Get progress of module that is currently loading
     *
     * @return mixed
     */
    public function getProgress()
    {
        $progress = 0;

        $module_name = $this->request->post['module_name'];
        $module_name_hashed = md5($module_name);
        $download_directory_hash = md5('downloads') . '/';

        $progress_file = DIR_SYSTEM . "teil/" . $download_directory_hash . $module_name_hashed . '.txt';

        if (file_exists($progress_file))
        {
            $progress = file_get_contents($progress_file);
        }

        echo $progress; die();
    }


    /**
     * Get list of already installed modules
     *
     * @return mixed
     */
    public function my()
    {
        $result = array(
            'apps' => $GLOBALS['TeilServiceProviders']
        );

        echo json_encode($result); die();
    }


    /**
     * Remove module
     *
     * @return void
     */
    public function remove()
    {
        $result = array(
            'status' => true
        );

        $module_name = $this->request->post['module_name'];

        $moduleInstaller = new ModuleInstaller(
            $this->db,
            $module_name,
            NULL, NULL
        );
        
        $moduleInstaller->remove();

        echo json_encode($result); die();
    }


}