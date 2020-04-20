-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateNewBasicGroupChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CreateNewBasicGroupChat = 
 CreateNewBasicGroupChat { title :: String, user_ids :: [Int] }  -- deriving (Show)

instance T.ToJSON CreateNewBasicGroupChat where
 toJSON (CreateNewBasicGroupChat { title = title, user_ids = user_ids }) =
  A.object [ "@type" A..= T.String "createNewBasicGroupChat", "title" A..= title, "user_ids" A..= user_ids ]
-- createNewBasicGroupChat CreateNewBasicGroupChat  { title :: String, user_ids :: [Int] } 

