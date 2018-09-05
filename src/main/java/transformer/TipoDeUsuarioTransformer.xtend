package transformer

import org.uqbar.arena.bindings.ValueTransformer
import eventos.TipoDeUsuario
import eventos.UsuarioAmateur
import eventos.UsuarioFree

class TipoDeUsuarioTransformer implements ValueTransformer<TipoDeUsuario, String> {

	override getModelType() {
		TipoDeUsuario
	}

	override getViewType() {
		String
	}

	override modelToView(TipoDeUsuario valueFromModel) {
		if(valueFromModel instanceof UsuarioFree ){
		return " No tan Free"
		} else if (valueFromModel instanceof UsuarioAmateur){
		return "Amateur"
		} else 
		{return "Profesional"	}
	}

	override viewToModel(String valueFromView) {
	}

}
