-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveTopChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TopChatCategory as TopChatCategory

--main = putStrLn "ok"

data RemoveTopChat = 
 RemoveTopChat { chat_id :: Int, category :: TopChatCategory.TopChatCategory }  -- deriving (Show)

instance T.ToJSON RemoveTopChat where
 toJSON (RemoveTopChat { chat_id = chat_id, category = category }) =
  A.object [ "@type" A..= T.String "removeTopChat", "chat_id" A..= chat_id, "category" A..= category ]
-- removeTopChat RemoveTopChat  { chat_id :: Int, category :: TopChatCategory.TopChatCategory } 

