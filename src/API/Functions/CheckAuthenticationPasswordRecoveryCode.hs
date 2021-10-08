-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckAuthenticationPasswordRecoveryCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Checks whether a password recovery code sent to an email address is valid. Works only when the current authorization state is authorizationStateWaitPassword 
-- 
-- __recovery_code__ Recovery code to check
data CheckAuthenticationPasswordRecoveryCode = 

 CheckAuthenticationPasswordRecoveryCode { recovery_code :: Maybe String }  deriving (Eq)

instance Show CheckAuthenticationPasswordRecoveryCode where
 show CheckAuthenticationPasswordRecoveryCode { recovery_code=recovery_code } =
  "CheckAuthenticationPasswordRecoveryCode" ++ cc [p "recovery_code" recovery_code ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CheckAuthenticationPasswordRecoveryCode where
 toJSON CheckAuthenticationPasswordRecoveryCode { recovery_code = recovery_code } =
  A.object [ "@type" A..= T.String "checkAuthenticationPasswordRecoveryCode", "recovery_code" A..= recovery_code ]

instance T.FromJSON CheckAuthenticationPasswordRecoveryCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkAuthenticationPasswordRecoveryCode" -> parseCheckAuthenticationPasswordRecoveryCode v
   _ -> mempty
  where
   parseCheckAuthenticationPasswordRecoveryCode :: A.Value -> T.Parser CheckAuthenticationPasswordRecoveryCode
   parseCheckAuthenticationPasswordRecoveryCode = A.withObject "CheckAuthenticationPasswordRecoveryCode" $ \o -> do
    recovery_code <- o A..:? "recovery_code"
    return $ CheckAuthenticationPasswordRecoveryCode { recovery_code = recovery_code }
 parseJSON _ = mempty
