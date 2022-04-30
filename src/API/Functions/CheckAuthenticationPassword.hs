-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckAuthenticationPassword where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Checks the authentication password for correctness. Works only when the current authorization state is authorizationStateWaitPassword 
-- 
-- __password__ The password to check
data CheckAuthenticationPassword = 

 CheckAuthenticationPassword { password :: Maybe String }  deriving (Eq)

instance Show CheckAuthenticationPassword where
 show CheckAuthenticationPassword { password=password } =
  "CheckAuthenticationPassword" ++ U.cc [U.p "password" password ]

instance T.ToJSON CheckAuthenticationPassword where
 toJSON CheckAuthenticationPassword { password = password } =
  A.object [ "@type" A..= T.String "checkAuthenticationPassword", "password" A..= password ]

instance T.FromJSON CheckAuthenticationPassword where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkAuthenticationPassword" -> parseCheckAuthenticationPassword v
   _ -> mempty
  where
   parseCheckAuthenticationPassword :: A.Value -> T.Parser CheckAuthenticationPassword
   parseCheckAuthenticationPassword = A.withObject "CheckAuthenticationPassword" $ \o -> do
    password <- o A..:? "password"
    return $ CheckAuthenticationPassword { password = password }
 parseJSON _ = mempty
