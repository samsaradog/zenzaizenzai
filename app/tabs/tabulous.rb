Tabulous.setup do

  tabs do
     home_tab do
       text          { 'Home' }
       link_path     { root_path }
       visible_when  { true }
       enabled_when  { true }
       active_when   { in_action('home').of_controller('pages') }
     end

     about_tab do
       text          { 'About' }
       link_path     { pages_about_path }
       visible_when  { true }
       enabled_when  { true }
       active_when   { a_subtab_is_active }
     end

     welcome_about_subtab do
       text          { 'Welcome' }
       link_path     { pages_about_path }
       visible_when  { true }
       enabled_when  { true }
       active_when   { in_action('about').of_controller('pages') }
     end

     zenzai_about_subtab do
       text          { 'Zenzai' }
       link_path     { pages_zenzai_path }
       visible_when  { true }
       enabled_when  { true }
       active_when   { in_action('zenzai').of_controller('pages') }
     end

     support_about_subtab do
       text          { 'Support' }
       link_path     { pages_support_path }
       visible_when  { true }
       enabled_when  { true }
       active_when   { in_action('support').of_controller('pages') }
     end

     sign_in_tab do
       text          { 'Sign in' }
       link_path     { new_user_session_path }
       visible_when  { current_user.nil? }
       enabled_when  { true }
       active_when   { in_action('any').of_controller('devise/sessions') }
     end

     sign_up_tab do
       text          { 'Sign up' }
       link_path     { new_user_registration_path }
       visible_when  { current_user.nil? }
       enabled_when  { true }
       active_when   { in_action('new').of_controller('devise/registrations') }
     end

     profile_tab do
       text          { 'Profile' }
       link_path     { edit_user_registration_path }
       visible_when  { current_user.present? }
       enabled_when  { true }
       active_when   { in_action('edit').of_controller('devise/registrations') }
     end

     jewel_tab do
       text          { 'Jewels' }
       link_path     { jewels_path }
       visible_when  { current_user.try(:is_admin?) }
       enabled_when  { true }
       active_when   { in_action('index').of_controller('jewels') }
     end

     sign_out_tab do
       text          { 'Sign out' }
       link_path     { destroy_user_session_path }
       http_verb     :delete
       visible_when  { current_user.present? }
       enabled_when  { true }
       active_when   { false }
     end
  end

  customize do

    # which class to use to generate HTML
    # :default, :html5, :bootstrap, or :bootstrap_pill
    # or create your own renderer class and reference it here
    # renderer :default
    renderer :foundation

    # whether to allow the active tab to be clicked
    # defaults to true
    # active_tab_clickable true

    # what to do when there is no active tab for the current controller action
    # :render -- draw the tabset, even though no tab is active
    # :do_not_render -- do not draw the tabset
    # :raise_error -- raise an error
    # defaults to :do_not_render
    # when_action_has_no_tab :do_not_render
    when_action_has_no_tab :render

    # whether to always add the HTML markup for subtabs, even if empty
    # defaults to false
    # render_subtabs_when_empty false

  end
end
