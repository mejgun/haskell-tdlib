-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckRecoveryEmailAddressCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Checks the 2-step verification recovery email address verification code 
-- 
-- __code__ Verification code to check
data CheckRecoveryEmailAddressCode = 

 CheckRecoveryEmailAddressCode { code :: Maybe String }  deriving (Eq)

instance Show CheckRecoveryEmailAddressCode where
 show CheckRecoveryEmailAddressCode { code=code } =
  "CheckRecoveryEmailAddressCode" ++ cc [p "code" code ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CheckRecoveryEmailAddressCode where
 toJSON CheckRecoveryEmailAddressCode { code = code } =
  A.object [ "@type" A..= T.String "checkRecoveryEmailAddressCode", "code" A..= code ]

instance T.FromJSON CheckRecoveryEmailAddressCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkRecoveryEmailAddressCode" -> parseCheckRecoveryEmailAddressCode v
   _ -> mempty
  where
   parseCheckRecoveryEmailAddressCode :: A.Value -> T.Parser CheckRecoveryEmailAddressCode
   parseCheckRecoveryEmailAddressCode = A.withObject "CheckRecoveryEmailAddressCode" $ \o -> do
    code <- o A..:? "code"
    return $ CheckRecoveryEmailAddressCode { code = code }
 parseJSON _ = mempty
