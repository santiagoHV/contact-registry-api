const countrySelect = document.getElementById('country_select');
const stateSelect = document.getElementById('state_select');
const citySelect = document.getElementById('city_select');
const form = document.querySelector('form');
const submitButton = document.getElementById('submit-button');

const onDelete = async (id) => {
    try{
        const url = `/api/v1/contacts/${id}`;
        const response = await fetch(url, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
            },
        })

        if (response.status === 204) {
            alert('Contacto borrado correctamente');
            const row = document.getElementById(`contact-${id}`);
            row.remove();
        }
    } catch (error) {
        console.log(error);
    }
}

const onSubmit = async () => {
    const formData = new FormData(form)
    const data = Object.fromEntries(formData.entries())

    data.city_id = parseInt(data.city_id)


    try{
        const response = await fetch('/api/v1/contacts', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })

        const result = await response.json();

        if (response.status === 201) {
            alert('Contacto creado exitosamente');
            window.location.reload();

        } else {
            alert(`Error al crear contacto - ${result.error}`)
        }

    }catch (e) {
        console.log(e);
    }
}

const onUpdate = async (id) => {
    //llena el formulario con los datos del contacto
    const url = `/api/v1/contacts/${id}`;
    const response = await fetch(url);
    const contact = await response.json();

    const {
        name,
        lastname,
        email,
        birthdate,
        address,
        detail,
        description,
    } = contact;

    city_id = contact.city.id;
    state_id = contact.city.state.id;
    country_id = contact.city.state.country.id;

    document.getElementById('name-input').value = name;
    document.getElementById('email-input').value = email;
    document.getElementById('lastname-input').value = lastname;
    document.getElementById('address-input').value = address;
    document.getElementById('detail-input').value = detail;
    document.getElementById('desc-input').value = description;
    document.getElementById('birthdate-input').value = birthdate;

    //TODO: login to set the selected option

    submitButton.innerHTML = 'Actualizar';
    submitButton.onclick = () => onSubmitUpdate(id);

}

const onSubmitUpdate = async (id) => {
    const formData = new FormData(form)
    const data = Object.fromEntries(formData.entries())
    data.city_id = parseInt(data.city_id)

    try{
        const url = `/api/v1/contacts/${id}`;
        const response = await fetch(url, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data)
        })

        if (response.status === 200) {
            alert('Contacto actualizado correctamente');
            window.location.reload();

        }else{
            alert(`Error al actualizar contacto - ${result.error}`);
        }

    }catch (e) {
        console.log(e);
    }
}

countrySelect.addEventListener('change', async () => {
    const countryId = countrySelect.value;

    if (countryId) {
        try{
            const response = await fetch(`/api/v1/countries/${countryId}/states`)
            const states = await response.json()

            stateSelect.innerHTML = '<option value="">Select State</option>'
            citySelect.innerHTML = '<option value="">Select City</option>'
            citySelect.disabled = true

            states.forEach(state => {
                const option = document.createElement('option')
                option.value = state.id
                option.text = state.name
                stateSelect.add(option)
            });

            stateSelect.disabled = false
        } catch (e) {
            console.log(e)
        }
    } else {
        stateSelect.innerHTML = '<option value="">Select State</option>'
        citySelect.innerHTML = '<option value="">Select City</option>'

        stateSelect.disabled = true
        citySelect.disabled = true
    }
})

stateSelect.addEventListener('change', async () => {
    const stateId = stateSelect.value

    if (stateId) {
        try{
            const response = await fetch(`/api/v1/states/${stateId}/cities`)
            const cities = await response.json()

            citySelect.innerHTML = '<option value="">Select City</option>'

            cities.forEach(city => {
                const option = document.createElement('option')
                option.value = city.id
                option.text = city.name
                citySelect.add(option)
            });

            citySelect.disabled = false
        } catch (e) {
            console.log(e);
        }
    } else {
        citySelect.innerHTML = '<option value="">Select City</option>'
        citySelect.disabled = true;
    }
})
