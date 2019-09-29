module SidebarMenusHelper

    def sidebar_menu 
        if current_user.role.name == "superuser"
            render "layouts/partials/dashboard/navs/superuser-nav"
        elsif current_user.role.name == "customer"
            render "layouts/partials/dashboard/navs/customer-nav"
        elsif current_user.role.name == "user"
            render "layouts/partials/dashboard/navs/user-nav"
        elsif current_user.role.name == "guest"
            render "layouts/partials/dashboard/navs/guest-nav"
        else
            render "layouts/partials/dashboard/navs/root-nav"


        end

    end

end