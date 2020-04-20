-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatList where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChatList = 
 ChatListMain 
 | ChatListArchive -- deriving (Show)

instance T.ToJSON ChatList where
 toJSON (ChatListMain {  }) =
  A.object [ "@type" A..= T.String "chatListMain" ]

 toJSON (ChatListArchive {  }) =
  A.object [ "@type" A..= T.String "chatListArchive" ]
-- chatListMain ChatList 

-- chatListArchive ChatList 

