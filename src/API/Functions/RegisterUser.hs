-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RegisterUser where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Finishes user registration. Works only when the current authorization state is authorizationStateWaitRegistration
-- 
-- __first_name__ The first name of the user; 1-64 characters
-- 
-- __last_name__ The last name of the user; 0-64 characters
data RegisterUser = 
 RegisterUser { last_name :: Maybe String, first_name :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON RegisterUser where
 toJSON (RegisterUser { last_name = last_name, first_name = first_name }) =
  A.object [ "@type" A..= T.String "registerUser", "last_name" A..= last_name, "first_name" A..= first_name ]

instance T.FromJSON RegisterUser where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "registerUser" -> parseRegisterUser v
   _ -> mempty
  where
   parseRegisterUser :: A.Value -> T.Parser RegisterUser
   parseRegisterUser = A.withObject "RegisterUser" $ \o -> do
    last_name <- o A..:? "last_name"
    first_name <- o A..:? "first_name"
    return $ RegisterUser { last_name = last_name, first_name = first_name }