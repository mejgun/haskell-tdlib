-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteSupergroup where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Deletes a supergroup or channel along with all messages in the corresponding chat. This will release the supergroup or channel username and remove all members; requires owner privileges in the supergroup or channel. Chats with more than 1000 members can't be deleted using this method 
-- 
-- __supergroup_id__ Identifier of the supergroup or channel
data DeleteSupergroup = 
 DeleteSupergroup { supergroup_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON DeleteSupergroup where
 toJSON (DeleteSupergroup { supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "deleteSupergroup", "supergroup_id" A..= supergroup_id ]

instance T.FromJSON DeleteSupergroup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteSupergroup" -> parseDeleteSupergroup v
   _ -> mempty
  where
   parseDeleteSupergroup :: A.Value -> T.Parser DeleteSupergroup
   parseDeleteSupergroup = A.withObject "DeleteSupergroup" $ \o -> do
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DeleteSupergroup { supergroup_id = supergroup_id }