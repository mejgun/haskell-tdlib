-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateBasicGroupChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CreateBasicGroupChat = 
 CreateBasicGroupChat { force :: Bool, basic_group_id :: Int }  -- deriving (Show)

instance T.ToJSON CreateBasicGroupChat where
 toJSON (CreateBasicGroupChat { force = force, basic_group_id = basic_group_id }) =
  A.object [ "@type" A..= T.String "createBasicGroupChat", "force" A..= force, "basic_group_id" A..= basic_group_id ]
-- createBasicGroupChat CreateBasicGroupChat  { force :: Bool, basic_group_id :: Int } 

