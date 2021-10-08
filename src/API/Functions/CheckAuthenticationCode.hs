-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckAuthenticationCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Checks the authentication code. Works only when the current authorization state is authorizationStateWaitCode 
-- 
-- __code__ The verification code received via SMS, Telegram message, phone call, or flash call
data CheckAuthenticationCode = 

 CheckAuthenticationCode { code :: Maybe String }  deriving (Eq)

instance Show CheckAuthenticationCode where
 show CheckAuthenticationCode { code=code } =
  "CheckAuthenticationCode" ++ cc [p "code" code ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CheckAuthenticationCode where
 toJSON CheckAuthenticationCode { code = code } =
  A.object [ "@type" A..= T.String "checkAuthenticationCode", "code" A..= code ]

instance T.FromJSON CheckAuthenticationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkAuthenticationCode" -> parseCheckAuthenticationCode v
   _ -> mempty
  where
   parseCheckAuthenticationCode :: A.Value -> T.Parser CheckAuthenticationCode
   parseCheckAuthenticationCode = A.withObject "CheckAuthenticationCode" $ \o -> do
    code <- o A..:? "code"
    return $ CheckAuthenticationCode { code = code }
 parseJSON _ = mempty
