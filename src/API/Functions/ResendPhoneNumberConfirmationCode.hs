-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendPhoneNumberConfirmationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ResendPhoneNumberConfirmationCode = 
 ResendPhoneNumberConfirmationCode -- deriving (Show)

instance T.ToJSON ResendPhoneNumberConfirmationCode where
 toJSON (ResendPhoneNumberConfirmationCode {  }) =
  A.object [ "@type" A..= T.String "resendPhoneNumberConfirmationCode" ]
-- resendPhoneNumberConfirmationCode ResendPhoneNumberConfirmationCode 



instance T.FromJSON ResendPhoneNumberConfirmationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resendPhoneNumberConfirmationCode" -> parseResendPhoneNumberConfirmationCode v
  where
   parseResendPhoneNumberConfirmationCode :: A.Value -> T.Parser ResendPhoneNumberConfirmationCode
   parseResendPhoneNumberConfirmationCode = A.withObject "ResendPhoneNumberConfirmationCode" $ \o -> do
    return $ ResendPhoneNumberConfirmationCode {  }