-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckPasswordRecoveryCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Checks whether a 2-step verification password recovery code sent to an email address is valid 
-- 
-- __recovery_code__ Recovery code to check
data CheckPasswordRecoveryCode = 

 CheckPasswordRecoveryCode { recovery_code :: Maybe String }  deriving (Eq)

instance Show CheckPasswordRecoveryCode where
 show CheckPasswordRecoveryCode { recovery_code=recovery_code } =
  "CheckPasswordRecoveryCode" ++ cc [p "recovery_code" recovery_code ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CheckPasswordRecoveryCode where
 toJSON CheckPasswordRecoveryCode { recovery_code = recovery_code } =
  A.object [ "@type" A..= T.String "checkPasswordRecoveryCode", "recovery_code" A..= recovery_code ]

instance T.FromJSON CheckPasswordRecoveryCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkPasswordRecoveryCode" -> parseCheckPasswordRecoveryCode v
   _ -> mempty
  where
   parseCheckPasswordRecoveryCode :: A.Value -> T.Parser CheckPasswordRecoveryCode
   parseCheckPasswordRecoveryCode = A.withObject "CheckPasswordRecoveryCode" $ \o -> do
    recovery_code <- o A..:? "recovery_code"
    return $ CheckPasswordRecoveryCode { recovery_code = recovery_code }
 parseJSON _ = mempty
