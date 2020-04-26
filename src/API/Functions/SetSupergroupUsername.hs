-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetSupergroupUsername where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Changes the username of a supergroup or channel, requires owner privileges in the supergroup or channel 
-- 
-- __supergroup_id__ Identifier of the supergroup or channel
-- 
-- __username__ New value of the username. Use an empty string to remove the username
data SetSupergroupUsername = 
 SetSupergroupUsername { username :: Maybe String, supergroup_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetSupergroupUsername where
 toJSON (SetSupergroupUsername { username = username, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "setSupergroupUsername", "username" A..= username, "supergroup_id" A..= supergroup_id ]

instance T.FromJSON SetSupergroupUsername where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setSupergroupUsername" -> parseSetSupergroupUsername v
   _ -> mempty
  where
   parseSetSupergroupUsername :: A.Value -> T.Parser SetSupergroupUsername
   parseSetSupergroupUsername = A.withObject "SetSupergroupUsername" $ \o -> do
    username <- o A..:? "username"
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetSupergroupUsername { username = username, supergroup_id = supergroup_id }