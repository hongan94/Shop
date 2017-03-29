ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "CHART" do
          div do
            column_chart [["2016-01-01", 30], ["2016-02-01", 54]], stacked: true, library: {colors: ["#D80A5B", "#21C8A9", "#F39C12", "#A4C400"]}
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin." do
						div do
              column_chart [["2016-01-01", 30],["2016-09-01", 100], ["2016-02-01", 54]], stacked: true, library: {colors: ["#D80A5B", "#21C8A9", "#F39C12", "#A4C400"]}
						end
					end
        end
      end
    end
  end # content
end
