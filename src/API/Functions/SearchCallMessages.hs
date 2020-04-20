-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchCallMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchCallMessages = 
 SearchCallMessages { only_missed :: Bool, limit :: Int, from_message_id :: Int }  -- deriving (Show)

instance T.ToJSON SearchCallMessages where
 toJSON (SearchCallMessages { only_missed = only_missed, limit = limit, from_message_id = from_message_id }) =
  A.object [ "@type" A..= T.String "searchCallMessages", "only_missed" A..= only_missed, "limit" A..= limit, "from_message_id" A..= from_message_id ]
-- searchCallMessages SearchCallMessages  { only_missed :: Bool, limit :: Int, from_message_id :: Int } 

