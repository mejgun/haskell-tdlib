-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleSupergroupSignMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ToggleSupergroupSignMessages = 
 ToggleSupergroupSignMessages { sign_messages :: Bool, supergroup_id :: Int }  -- deriving (Show)

instance T.ToJSON ToggleSupergroupSignMessages where
 toJSON (ToggleSupergroupSignMessages { sign_messages = sign_messages, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "toggleSupergroupSignMessages", "sign_messages" A..= sign_messages, "supergroup_id" A..= supergroup_id ]
-- toggleSupergroupSignMessages ToggleSupergroupSignMessages  { sign_messages :: Bool, supergroup_id :: Int } 

