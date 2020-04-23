-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateTemporaryPassword where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CreateTemporaryPassword = 
 CreateTemporaryPassword { valid_for :: Maybe Int, password :: Maybe String }  deriving (Show)

instance T.ToJSON CreateTemporaryPassword where
 toJSON (CreateTemporaryPassword { valid_for = valid_for, password = password }) =
  A.object [ "@type" A..= T.String "createTemporaryPassword", "valid_for" A..= valid_for, "password" A..= password ]

instance T.FromJSON CreateTemporaryPassword where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createTemporaryPassword" -> parseCreateTemporaryPassword v
   _ -> mempty
  where
   parseCreateTemporaryPassword :: A.Value -> T.Parser CreateTemporaryPassword
   parseCreateTemporaryPassword = A.withObject "CreateTemporaryPassword" $ \o -> do
    valid_for <- optional $ o A..: "valid_for"
    password <- optional $ o A..: "password"
    return $ CreateTemporaryPassword { valid_for = valid_for, password = password }