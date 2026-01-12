@extends('backend.layouts.master')

@section('title','Order Detail')

@section('main-content')
<div class="card">
<h5 class="card-header">Pesanan</h5>
  <div class="card-body">
    @if($order)
    <table class="table table-striped table-hover">
      <thead>
        <tr>
            <th>#</th>
            <th>No Pesanan</th>
            <th>Nama</th>
            <th>Email</th>
            <th>Jumlah</th>
            <th>Biaya</th>
            <th>Total</th>
            <th>Status</th>
            <th>Aksi</th>
        </tr>
      </thead>
      <tbody>
        <tr>
            <td>{{$order->id}}</td>
            <td>{{$order->order_number}}</td>
            <td>{{$order->first_name}} {{$order->last_name}}</td>
            <td>{{$order->email}}</td>
            <td>{{$order->quantity}}</td>
            <td>Rp.{{$order->shipping->price}}</td>
            <td>Rp.{{number_format($order->total_amount,2)}}</td>
            <td>
                @if($order->status=='new')
                  <span class="badge badge-primary">BARU</span>
                @elseif($order->status=='process')
                  <span class="badge badge-warning">DIPROSES</span>
                @elseif($order->status=='delivered')
                  <span class="badge badge-success">DIKIRIM</span>
                @else
                  <span class="badge badge-danger">{{$order->status}}</span>
                @endif
            </td>
            <td>
                <a href="{{route('order.edit',$order->id)}}" class="btn btn-primary btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="edit" data-placement="bottom"><i class="fas fa-edit"></i></a>
                <form method="POST" action="{{route('order.destroy',[$order->id])}}">
                  @csrf
                  @method('delete')
                      <button class="btn btn-danger btn-sm dltBtn" data-id={{$order->id}} style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash-alt"></i></button>
                </form>
            </td>

        </tr>
      </tbody>
    </table>

    <section class="confirmation_part section_padding">
      <div class="order_boxes">
        <div class="row">
          <div class="col-lg-6 col-lx-4">
            <div class="order-info">
              <h4 class="text-center pb-4">INFORMASI PESANAN</h4>
              <table class="table">
                    <tr class="">
                        <td>Nomor Pesanan</td>
                        <td> : {{$order->order_number}}</td>
                    </tr>
                    <tr>
                        <td>Waktu Pesanan</td>
                        <td> : {{$order->created_at->format('D d M, Y')}} at {{$order->created_at->format('g : i a')}} </td>
                    </tr>
                    <tr>
                        <td>Jumlah</td>
                        <td> : {{$order->quantity}}</td>
                    </tr>
                    <tr>
                        <td>Status Pesanan</td>
                        <td> : {{$order->status}}</td>
                    </tr>
                    <tr>
                        <td>Biaya Pengiriman</td>
                        <td> : Rp. {{$order->shipping->price}}</td>
                    </tr>
                    <tr>
                      <td>Kupon</td>
                      <td> : Rp. {{number_format($order->coupon,2)}}</td>
                    </tr>
                    <tr>
                        <td>Total</td>
                        <td> : Rp. {{number_format($order->total_amount,2)}}</td>
                    </tr>
                    <tr>
                        <!-- <td>Payment Method</td>
                        <td> : @if($order->payment_method=='cod') Cash on Delivery @else Paypal @endif</td> -->
                        <td>Pembayaran</td>
                        <td> : 
                            @if($order->payment_method == 'cod')
                                Cash on Delivery
                            @elseif($order->payment_method == 'paypal')
                                Paypal
                            @elseif($order->payment_method == 'cardpay')
                                Card Payment
                            @endif
                        </td>

                    </tr>
                    <!-- <tr>
                        <td>Payment Status</td>
                        <td> : {{$order->payment_status}}</td>
                    </tr> -->
                    <tr>
                      <td>Status Pembayaran</td>
                      <td> : 
                          @if($order->payment_status == 'paid')
                              <span class="badge badge-success">Paid</span>
                          @elseif($order->payment_status == 'unpaid')
                              <span class="badge badge-danger">Unpaid</span>
                          @else
                              {{$order->payment_status}}
                          @endif
                      </td>
                  </tr>

              </table>
            </div>
          </div>

          <div class="col-lg-6 col-lx-4">
            <div class="shipping-info">
              <h4 class="text-center pb-4">SHIPPING INFORMATION</h4>
              <table class="table">
                    <tr class="">
                        <td>Full Name</td>
                        <td> : {{$order->first_name}} {{$order->last_name}}</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td> : {{$order->email}}</td>
                    </tr>
                    <tr>
                        <td>Phone No.</td>
                        <td> : {{$order->phone}}</td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td> : {{$order->address1}}, {{$order->address2}}</td>
                    </tr>
                    <tr>
                        <td>Country</td>
                        <td> : {{$order->country}}</td>
                    </tr>
                    <tr>
                        <td>Post Code</td>
                        <td> : {{$order->post_code}}</td>
                    </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>
    @endif

  </div>
</div>
@endsection

@push('styles')
<style>
    .order-info,.shipping-info{
        background:#ECECEC;
        padding:20px;
    }
    .order-info h4,.shipping-info h4{
        text-decoration: underline;
    }

</style>
@endpush
