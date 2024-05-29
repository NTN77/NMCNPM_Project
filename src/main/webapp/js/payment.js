function showPoliciesAndTerms(option) {
    var s = document.getElementById("infor_center");
    var t = document.getElementById("infor_center_title");
    var c = document.getElementById("infor_center_content");
    let newContent;
    console.log(option)
    if (option == 1) {
        t.innerHTML = "Chính sách hoàn trả"
        newContent = "CHÍNH SÁCH ĐỔI TRẢ HÀNG\n" +
            "-Thời gian hoàn trả: Trong vòng 24h sau khi nhận hàng để bạn có thể hoàn trả sản phẩm nếu không hài lòng.\n" +
            "\n" +
            "-Điều kiện hoàn trả: Điều kiện này có thể bao gồm việc sản phẩm phải còn nguyên vẹn, không bị hỏng hóc, không có dấu vết sử dụng quá mức, và còn trong tình trạng mới như khi bạn mua.\n" +
            "\n" +
            "-Phí hoàn trả: Có thể áp dụng phí hoàn trả, đặc biệt nếu lý do hoàn trả không phải là lỗi từ phía họ mà là do sở thích cá nhân hoặc không hài lòng về sản phẩm.\n" +
            "\n" +
            "-Hình thức hoàn trả: Bạn cần mang sản phẩm và hóa đơn mua hàng đến cửa hàng để được hoàn trả.\n" +
            "\n" +
            "-Chính sách bảo hành: Nếu sản phẩm có vấn đề kỹ thuật sau khi mua, thì chính sách bảo hành sẽ áp dụng thay vì chính sách hoàn trả.\n" ;
        c.innerHTML = newContent;
    } else if (option == 2) {
        t.innerHTML = "Chính sách bảo mật"
        c.innerHTML =
            "CHÍNH SÁCH BẢO MẬT\n" +
            "Cám ơn quý khách đã quan tâm và truy cập vào website. Chúng tôi tôn trọng và cam kết sẽ bảo mật những thông tin mang tính riêng tư của Quý khách.\n" +
            "Chính sách bảo mật sẽ giải thích cách chúng tôi tiếp nhận, sử dụng và (trong trường hợp nào đó) tiết lộ thông tin cá nhân của Quý khách.\n" +
            "Bảo vệ dữ liệu cá nhân và gây dựng được niềm tin cho quý khách là vấn đề rất quan trọng với chúng tôi. Vì vậy, chúng tôi sẽ dùng tên và các thông tin khác liên quan đến quý khách tuân thủ theo nội dung của Chính sách bảo mật. Chúng tôi chỉ thu thập những thông tin cần thiết liên quan đến giao dịch mua bán.\n" +
            "Chúng tôi sẽ giữ thông tin của khách hàng trong thời gian luật pháp quy định hoặc cho mục đích nào đó. Quý khách có thể truy cập vào website và trình duyệt mà không cần phải cung cấp chi tiết cá nhân. Lúc đó, Quý khách đang ẩn danh và chúng tôi không thể biết bạn là ai nếu Quý khách không đăng nhập vào tài khoản của mình.\n" +
            "1. Thu thập thông tin cá nhân\n" +
            "- Chúng tôi thu thập, lưu trữ và xử lý thông tin của bạn cho quá trình mua hàng và cho những thông báo sau này liên quan đến đơn hàng, và để cung cấp dịch vụ, bao gồm một số thông tin cá nhân: danh hiệu, tên, giới tính, ngày sinh, email, địa chỉ, địa chỉ giao hàng, số điện thoại, fax, chi tiết thanh toán, chi tiết thanh toán bằng thẻ hoặc chi tiết tài khoản ngân hàng.\n" +
            "- Chúng tôi sẽ dùng thông tin quý khách đã cung cấp để xử lý đơn đặt hàng, cung cấp các dịch vụ và thông tin yêu cầu thông qua website và theo yêu cầu của bạn.\n" +
            "- Hơn nữa, chúng tôi sẽ sử dụng các thông tin đó để quản lý tài khoản của bạn; xác minh và thực hiện giao dịch trực tuyến, nhận diện khách vào web, nghiên cứu nhân khẩu học, gửi thông tin bao gồm thông tin sản phẩm và dịch vụ. Nếu quý khách không muốn nhận bất cứ thông tin tiếp thị của chúng tôi thì có thể từ chối bất cứ lúc nào.\n" +
            "- Chúng tôi có thể chuyển tên và địa chỉ cho bên thứ ba để họ giao hàng cho bạn (ví dụ cho bên chuyển phát nhanh hoặc nhà cung cấp).\n" +
            "- Chi tiết đơn đặt hàng của bạn được chúng tôi lưu giữ nhưng vì lí do bảo mật nên chúng tôi không công khai trực tiếp được. Tuy nhiên, quý khách có thể tiếp cận thông tin bằng cách đăng nhập tài khoản trên web. Tại đây, quý khách sẽ thấy chi tiết đơn đặt hàng của mình, những sản phẩm đã nhận và những sản phẩm đã gửi và chi tiết email, ngân hàng và bản tin mà bạn đặt theo dõi dài hạn.\n" +
            "- Quý khách cam kết bảo mật dữ liệu cá nhân và không được phép tiết lộ cho bên thứ ba. Chúng tôi không chịu bất kỳ trách nhiệm nào cho việc dùng sai mật khẩu nếu đây không phải lỗi của chúng tôi.\n" +
            "- Chúng tôi có thể dùng thông tin cá nhân của bạn để nghiên cứu thị trường. mọi thông tin chi tiết sẽ được ẩn và chỉ được dùng để thống kê. Quý khách có thể từ chối không tham gia bất cứ lúc nào.\n" +
            "2. Bảo mật\n" +
            "- Chúng tôi có biện pháp thích hợp về kỹ thuật và an ninh để ngăn chặn truy cập trái phép hoặc trái pháp luật hoặc mất mát hoặc tiêu hủy hoặc thiệt hại cho thông tin của bạn.\n" +
            "- Chúng tôi khuyên quý khách không nên đưa thông tin chi tiết về việc thanh toán với bất kỳ ai bằng e-mail, chúng tôi không chịu trách nhiệm về những mất mát quý khách có thể gánh chịu trong việc trao đổi thông tin của quý khách qua internet hoặc email.\n" +
            "- Quý khách tuyệt đối không sử dụng bất kỳ chương trình, công cụ hay hình thức nào khác để can thiệp vào hệ thống hay làm thay đổi cấu trúc dữ liệu. Nghiêm cấm việc phát tán, truyền bá hay cổ vũ cho bất kỳ hoạt động nào nhằm can thiệp, phá hoại hay xâm nhập vào dữ liệu của hệ thống website. Mọi vi phạm sẽ bị tước bỏ mọi quyền lợi cũng như sẽ bị truy tố trước pháp luật nếu cần thiết.\n" +
            "- Mọi thông tin giao dịch sẽ được bảo mật nhưng trong trường hợp cơ quan pháp luật yêu cầu, chúng tôi sẽ buộc phải cung cấp những thông tin này cho các cơ quan pháp luật.\n" +
            "Các điều kiện, điều khoản và nội dung của trang web này được điều chỉnh bởi luật pháp Việt Nam và tòa án Việt Nam có thẩm quyền xem xét.\n" +
            "3. Quyền lợi khách hàng\n" +
            "-Quý khách có quyền yêu cầu truy cập vào dữ liệu cá nhân của mình, có quyền yêu cầu chúng tôi sửa lại những sai sót trong dữ liệu của bạn mà không mất phí. Bất cứ lúc nào bạn cũng có quyền yêu cầu chúng tôi ngưng sử dụng dữ liệu cá nhân của bạn cho mục đích tiếp thị."
    } else if (option == 3) {
        t.innerHTML = "Điều khoản sử dụng"
        c.innerHTML = "HƯỚNG DẪN MUA HÀNG\n" +
            "Bước 1: Truy cập website và lựa chọn sản phẩm cần mua để mua hàng\n" +
            "Bước 2:  Click và sản phẩm muốn mua, màn hình hiển thị ra pop up với các lựa chọn sau:\n" +
            "Nếu bạn muốn tiếp tục mua hàng: Bấm vào phần tiếp tục mua hàng để lựa chọn thêm sản phẩm vào giỏ hàng\n" +
            "Nếu bạn muốn xem giỏ hàng để cập nhật sản phẩm: Bấm vào xem giỏ hàng\n" +
            "Nếu bạn muốn đặt hàng và thanh toán cho sản phẩm này vui lòng bấm vào: Đặt hàng và thanh toán\n" +
            "Bước 3: Lựa chọn thông tin tài khoản thanh toán\n" +
            "Nếu bạn đã có tài khoản vui lòng nhập thông tin tên đăng nhập là email và mật khẩu vào mục đã có tài khoản trên hệ thống\n" +
            "Nếu bạn chưa có tài khoản và muốn đăng ký tài khoản vui lòng điền các thông tin cá nhân để tiếp tục đăng ký tài khoản. Khi có tài khoản bạn sẽ dễ dàng theo dõi được đơn hàng của mình\n" +
            "Nếu bạn muốn mua hàng mà không cần tài khoản vui lòng nhấp chuột vào mục đặt hàng không cần tài khoản\n" +
            "Bước 4: Điền các thông tin của bạn để nhận đơn hàng, lựa chọn hình thức thanh toán và vận chuyển cho đơn hàng của mình\n" +
            "Bước 5: Xem lại thông tin đặt hàng, điền chú thích và gửi đơn hàng\n" +
            "Sau khi nhận được đơn hàng bạn gửi chúng tôi sẽ liên hệ bằng cách gọi điện lại để xác nhận lại đơn hàng và địa chỉ của bạn.\n" +
            "Trân trọng cảm ơn."
    } else {
        c.innerHTML = "null"
    }
    s.style.display = "block";
}

function hidePoliciesAndTerms() {
    document.getElementById("infor_center").style.display = "none";
}

function hideBankaccount_infor() {
    document.getElementById("bankaccount_infor").style.display = "none";
}

