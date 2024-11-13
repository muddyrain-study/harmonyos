import CommonConstants from '../../components/constant/CommonConstant';
import { MyColumnLayout } from '../../components/MyColumnLayout';
import { MyRowLayout } from '../../components/MyRowLayout';

@Entry
@Component
struct LayoutPage1 {
  @State message: string = 'Hello World';

  build() {
    Column({ space: CommonConstants.COLUMN_SPACE }) {
      MyRowLayout()
      MyRowLayout()
      MyColumnLayout()
      MyColumnLayout()
      MyColumnLayout()
    }
    .height(CommonConstants.FULL_LENGTH)
    .width(CommonConstants.FULL_LENGTH)
  }
}
