-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateTemporaryPassword where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CreateTemporaryPassword = 
 CreateTemporaryPassword { valid_for :: Maybe Int, password :: Maybe String }  deriving (Show, Eq)

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
    valid_for <- mconcat [ o A..:? "valid_for", readMaybe <$> (o A..: "valid_for" :: T.Parser String)] :: T.Parser (Maybe Int)
    password <- o A..:? "password"
    return $ CreateTemporaryPassword { valid_for = valid_for, password = password }