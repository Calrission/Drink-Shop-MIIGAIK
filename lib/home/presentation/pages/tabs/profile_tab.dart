import 'package:drink_shop/auth/presentation/pages/sign_in_page.dart';
import 'package:drink_shop/core/ui/dialogs/dialog_message.dart';
import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/home/domain/profile_tab_usecase.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  StateWithLibrary<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends StateWithLibrary<ProfileTab> {

  ProfileTabUseCase useCase = ProfileTabUseCase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLibrary.colorBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 74),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    color: Colors.grey,
                    width: 120,
                    height: 120,
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                ),
                const SizedBox(width: 22),
                const Expanded(
                  child: Text(
                    "Смирнова Мария Максимовна",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 28),
            const Divider(color: Color(0xFF3A3A3A), height: 1),
            const SizedBox(height: 28),
            const Text(
              "Основное",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              "История заказов",
              style: TextStyle(
                  fontSize: 14
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              "Уведомления",
              style: TextStyle(
                  fontSize: 14
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Настройки",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              "Редактирование профиля",
              style: TextStyle(
                  fontSize: 14
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              "Политика конфиденциальности",
              style: TextStyle(
                  fontSize: 14
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              "Сменить почту",
              style: TextStyle(
                  fontSize: 14
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              "Сменить пароль",
              style: TextStyle(
                  fontSize: 14
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              "О нас",
              style: TextStyle(
                  fontSize: 14
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () async {
                    await useCase.pressLogout(
                        (){
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (_) => const SignInPage()),
                                  (route) => false
                          );
                        },
                        (error){
                          MessageDialog.showError(context, error);
                        }
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFFCA0000),
                      width: 1
                    )
                  ),
                  child: const Text(
                    "Выход",
                    style: TextStyle(
                      color: Color(0xFFCA0000)
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}