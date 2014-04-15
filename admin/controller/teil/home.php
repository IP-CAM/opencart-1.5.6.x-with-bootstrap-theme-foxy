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
            
        }
        
        // DOM elements
        $this->document->setTitle('Менеджер меню');
        
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
        
        // // Install
        // if ($this->model_design_menu->needInstall())
        //     $this->redirect($this->url->link('design/menu', 'token=' . $this->session->data['token'], 'SSL'));
        
        // // If there isn't any menus
        // if ( ! $this->model_design_menu->getMenuNumber())
        //     $this->redirect($this->url->link('design/menu/welcome', 'token=' . $this->session->data['token'], 'SSL'));

        // Database
        // $menus = $this->model_design_menu->getMenuList();
        // $items = $this->model_design_menu->getMenuItems();
        // $languages = $this->model_localisation_language->getLanguages();
        // $adminLang = $this->model_design_menu->getAdminLang();

        // Render
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $loader = new TeilDownloader(
            "http://pimi.website-builder.ru/MenuModule.zip",
            'Menu'
        );

        $file = $loader->load(
            function($moduleName, $filename, $dir) 
            {
                $moduleInstaller = new ModuleInstaller(
                    $this->db,
                    $moduleName,
                    $filename,
                    $dir
                );
                // $moduleInstaller->unzip();
                $moduleInstaller->boot();
            }
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


    // install module
    public function install()
    {
        
    }


}