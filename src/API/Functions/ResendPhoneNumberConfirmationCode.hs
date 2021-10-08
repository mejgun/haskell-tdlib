-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendPhoneNumberConfirmationCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Resends phone number confirmation code
data ResendPhoneNumberConfirmationCode = 

 ResendPhoneNumberConfirmationCode deriving (Eq)

instance Show ResendPhoneNumberConfirmationCode where
 show ResendPhoneNumberConfirmationCode {  } =
  "ResendPhoneNumberConfirmationCode" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ResendPhoneNumberConfirmationCode where
 toJSON ResendPhoneNumberConfirmationCode {  } =
  A.object [ "@type" A..= T.String "resendPhoneNumberConfirmationCode" ]

instance T.FromJSON ResendPhoneNumberConfirmationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resendPhoneNumberConfirmationCode" -> parseResendPhoneNumberConfirmationCode v
   _ -> mempty
  where
   parseResendPhoneNumberConfirmationCode :: A.Value -> T.Parser ResendPhoneNumberConfirmationCode
   parseResendPhoneNumberConfirmationCode = A.withObject "ResendPhoneNumberConfirmationCode" $ \o -> do
    return $ ResendPhoneNumberConfirmationCode {  }
 parseJSON _ = mempty
