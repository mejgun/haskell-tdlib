-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreatePrivateChat where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CreatePrivateChat = 
 CreatePrivateChat { force :: Maybe Bool, user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON CreatePrivateChat where
 toJSON (CreatePrivateChat { force = force, user_id = user_id }) =
  A.object [ "@type" A..= T.String "createPrivateChat", "force" A..= force, "user_id" A..= user_id ]

instance T.FromJSON CreatePrivateChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createPrivateChat" -> parseCreatePrivateChat v
   _ -> mempty
  where
   parseCreatePrivateChat :: A.Value -> T.Parser CreatePrivateChat
   parseCreatePrivateChat = A.withObject "CreatePrivateChat" $ \o -> do
    force <- optional $ o A..: "force"
    user_id <- optional $ o A..: "user_id"
    return $ CreatePrivateChat { force = force, user_id = user_id }