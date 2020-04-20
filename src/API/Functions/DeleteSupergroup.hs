-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteSupergroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DeleteSupergroup = 
 DeleteSupergroup { supergroup_id :: Int }  -- deriving (Show)

instance T.ToJSON DeleteSupergroup where
 toJSON (DeleteSupergroup { supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "deleteSupergroup", "supergroup_id" A..= supergroup_id ]
-- deleteSupergroup DeleteSupergroup  { supergroup_id :: Int } 

