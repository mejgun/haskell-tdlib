-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckPhoneNumberConfirmationCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Checks phone number confirmation code 
-- 
-- __code__ Confirmation code to check
data CheckPhoneNumberConfirmationCode = 

 CheckPhoneNumberConfirmationCode { code :: Maybe String }  deriving (Eq)

instance Show CheckPhoneNumberConfirmationCode where
 show CheckPhoneNumberConfirmationCode { code=code } =
  "CheckPhoneNumberConfirmationCode" ++ cc [p "code" code ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CheckPhoneNumberConfirmationCode where
 toJSON CheckPhoneNumberConfirmationCode { code = code } =
  A.object [ "@type" A..= T.String "checkPhoneNumberConfirmationCode", "code" A..= code ]

instance T.FromJSON CheckPhoneNumberConfirmationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkPhoneNumberConfirmationCode" -> parseCheckPhoneNumberConfirmationCode v
   _ -> mempty
  where
   parseCheckPhoneNumberConfirmationCode :: A.Value -> T.Parser CheckPhoneNumberConfirmationCode
   parseCheckPhoneNumberConfirmationCode = A.withObject "CheckPhoneNumberConfirmationCode" $ \o -> do
    code <- o A..:? "code"
    return $ CheckPhoneNumberConfirmationCode { code = code }
 parseJSON _ = mempty
