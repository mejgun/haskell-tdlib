-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateSupergroupChat where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CreateSupergroupChat = 
 CreateSupergroupChat { force :: Maybe Bool, supergroup_id :: Maybe Int }  deriving (Show)

instance T.ToJSON CreateSupergroupChat where
 toJSON (CreateSupergroupChat { force = force, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "createSupergroupChat", "force" A..= force, "supergroup_id" A..= supergroup_id ]

instance T.FromJSON CreateSupergroupChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createSupergroupChat" -> parseCreateSupergroupChat v
   _ -> mempty
  where
   parseCreateSupergroupChat :: A.Value -> T.Parser CreateSupergroupChat
   parseCreateSupergroupChat = A.withObject "CreateSupergroupChat" $ \o -> do
    force <- optional $ o A..: "force"
    supergroup_id <- optional $ o A..: "supergroup_id"
    return $ CreateSupergroupChat { force = force, supergroup_id = supergroup_id }