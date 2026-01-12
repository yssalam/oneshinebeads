@extends('frontend.layouts.master')

@section('title', 'ONE SHINE BEADS || Kontak Kami')

@section('main-content')
	<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li><a href="{{route('home')}}">Beranda<i class="ti-arrow-right"></i></a></li>
							<li class="active"><a href="javascript:void(0);">Kontak Kami</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<!-- Start Contact -->
	<section id="contact-us" class="contact-us section">
		<div class="container">
			<div class="contact-head">
				<div class="row">
					<div class="col-lg-8 col-12">
						<div class="form-main">
							<div class="title">
								@php
									$settings = DB::table('settings')->get();
								@endphp
								<h4>ONE SHINE BEADS</h4>
								<h3>Selamat Datang</h3>
								<p>@foreach($settings as $data) {{$data->description}} @endforeach</p>
								<p class="text">@foreach($settings as $data) {{$data->short_des}} @endforeach</p>
							</div>
							<form class="form-contact form contact_form" method="post" action="{{route('contact.store')}}"
								id="contactForm" novalidate="novalidate">
								@csrf
								
							</form>
						</div>
						</div>
						<div class="col-lg-4 col-12">
						<div class="single-head">
							<div class="single-info">
								<i class="fa fa-phone"></i>
								<h4 class="title">Hubungi Kami:</h4>
								<ul>
									<li>@foreach($settings as $data) {{$data->phone}} @endforeach</li>
								</ul>
							</div>
							<div class="single-info">
								<i class="fa fa-envelope-open"></i>
								<h4 class="title">Email:</h4>
								<ul>
									<li><a href="mailto:info@yourwebsite.com">@foreach($settings as $data) {{$data->email}}
									@endforeach</a></li>
								</ul>
							</div>
							<div class="single-info">
								<i class="fa fa-location-arrow"></i>
								<h4 class="title">Alamat Kami:</h4>
								<ul>
									<li>@foreach($settings as $data) {{$data->address}} @endforeach</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/ End Contact -->

	<!-- Map Section -->
	<div class="map-section">
		<div id="myMap">
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d416.28426122840324!2d107.7615016375042!3d-6.963752073340716!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sJl.%20Beringin%20Raya%20No.55%2C%20RT.005%2FRW.020%2C%20wetanan%2C%20Kec.%20Rancaekek%2C%20Kabupaten%20Bandung%2C%20Jawa%20Barat%2040394!5e0!3m2!1sid!2sid!4v1750006790975!5m2!1sid!2sid"
				width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false"
				tabindex="0"></iframe>
		</div>
	</div>
	<!--/ End Map Section -->


	<!--================Contact Success  =================-->
	<div class="modal fade" id="success" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="text-success">Terima Kasih</h2>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p class="text-success">Pesanmu Sudah Terkirim...</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Modals error -->
	<div class="modal fade" id="error" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="text-warning">Maaf</h2>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p class="text-warning">Ada Yang Salah.</p>
				</div>
			</div>
		</div>
	</div>
@endsection

@push('styles')
	<style>
		.modal-dialog .modal-content .modal-header {
			position: initial;
			padding: 10px 20px;
			border-bottom: 1px solid #e9ecef;
		}

		.modal-dialog .modal-content .modal-body {
			height: 100px;
			padding: 10px 20px;
		}

		.modal-dialog .modal-content {
			width: 50%;
			border-radius: 0;
			margin: auto;
		}
	</style>
@endpush
@push('scripts')
	<script src="{{ asset('frontend/js/jquery.form.js') }}"></script>
	<script src="{{ asset('frontend/js/jquery.validate.min.js') }}"></script>
	<script src="{{ asset('frontend/js/contact.js') }}"></script>
@endpush