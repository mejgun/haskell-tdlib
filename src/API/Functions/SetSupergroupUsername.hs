-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetSupergroupUsername where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetSupergroupUsername = 
 SetSupergroupUsername { username :: String, supergroup_id :: Int }  -- deriving (Show)

instance T.ToJSON SetSupergroupUsername where
 toJSON (SetSupergroupUsername { username = username, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "setSupergroupUsername", "username" A..= username, "supergroup_id" A..= supergroup_id ]
-- setSupergroupUsername SetSupergroupUsername  { username :: String, supergroup_id :: Int } 

