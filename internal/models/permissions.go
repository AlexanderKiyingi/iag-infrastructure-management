package models

type PermissionDescriptor struct {
	Name        string
	Description string
}

// PermissionDescriptors is the catalogue registered with iag-authentication at
// boot. Seeded with the baseline read/write permissions; expanded as the
// infrastructure domain (facilities, utilities, capex, maintenance) is
// implemented.
func PermissionDescriptors() []PermissionDescriptor {
	return []PermissionDescriptor{
		{Name: "infrastructure.view_overview", Description: "View infrastructure-management service overview and status"},
		{Name: "infrastructure.view_assets", Description: "View facilities, utilities, capex projects, and maintenance assets"},
		{Name: "infrastructure.change_assets", Description: "Create and update infrastructure assets, maintenance, and capex records"},
	}
}
