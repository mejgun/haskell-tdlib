-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetSupergroupUsername where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetSupergroupUsername = 
 SetSupergroupUsername { username :: String, supergroup_id :: Int }  deriving (Show)

instance T.ToJSON SetSupergroupUsername where
 toJSON (SetSupergroupUsername { username = username, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "setSupergroupUsername", "username" A..= username, "supergroup_id" A..= supergroup_id ]



instance T.FromJSON SetSupergroupUsername where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setSupergroupUsername" -> parseSetSupergroupUsername v

   _ -> mempty ""
  where
   parseSetSupergroupUsername :: A.Value -> T.Parser SetSupergroupUsername
   parseSetSupergroupUsername = A.withObject "SetSupergroupUsername" $ \o -> do
    username <- o A..: "username"
    supergroup_id <- o A..: "supergroup_id"
    return $ SetSupergroupUsername { username = username, supergroup_id = supergroup_id }