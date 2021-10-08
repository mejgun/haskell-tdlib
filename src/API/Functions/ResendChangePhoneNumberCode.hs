-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendChangePhoneNumberCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Re-sends the authentication code sent to confirm a new phone number for the current user. Works only if the previously received authenticationCodeInfo next_code_type was not null and the server-specified timeout has passed
data ResendChangePhoneNumberCode = 

 ResendChangePhoneNumberCode deriving (Eq)

instance Show ResendChangePhoneNumberCode where
 show ResendChangePhoneNumberCode {  } =
  "ResendChangePhoneNumberCode" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ResendChangePhoneNumberCode where
 toJSON ResendChangePhoneNumberCode {  } =
  A.object [ "@type" A..= T.String "resendChangePhoneNumberCode" ]

instance T.FromJSON ResendChangePhoneNumberCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resendChangePhoneNumberCode" -> parseResendChangePhoneNumberCode v
   _ -> mempty
  where
   parseResendChangePhoneNumberCode :: A.Value -> T.Parser ResendChangePhoneNumberCode
   parseResendChangePhoneNumberCode = A.withObject "ResendChangePhoneNumberCode" $ \o -> do
    return $ ResendChangePhoneNumberCode {  }
 parseJSON _ = mempty
