-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateNewSecretChat where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CreateNewSecretChat = 
 CreateNewSecretChat { user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON CreateNewSecretChat where
 toJSON (CreateNewSecretChat { user_id = user_id }) =
  A.object [ "@type" A..= T.String "createNewSecretChat", "user_id" A..= user_id ]

instance T.FromJSON CreateNewSecretChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createNewSecretChat" -> parseCreateNewSecretChat v
   _ -> mempty
  where
   parseCreateNewSecretChat :: A.Value -> T.Parser CreateNewSecretChat
   parseCreateNewSecretChat = A.withObject "CreateNewSecretChat" $ \o -> do
    user_id <- optional $ o A..: "user_id"
    return $ CreateNewSecretChat { user_id = user_id }