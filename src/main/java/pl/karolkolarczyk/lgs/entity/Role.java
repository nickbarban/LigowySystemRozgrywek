package pl.karolkolarczyk.lgs.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity(name = "rola_uzytkownika")
public class Role {

	@Id
	@GeneratedValue
	int id;

	@Column(nullable = false, unique = true)
	private String name;

	@ManyToMany(mappedBy = "roles", fetch = FetchType.EAGER)
	private List<User> users;

	public Role() {

	}

	public Role(String roleName) {
		this.name = roleName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

}
