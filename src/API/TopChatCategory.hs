-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TopChatCategory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TopChatCategory = 
 TopChatCategoryUsers 
 | TopChatCategoryBots 
 | TopChatCategoryGroups 
 | TopChatCategoryChannels 
 | TopChatCategoryInlineBots 
 | TopChatCategoryCalls 
 | TopChatCategoryForwardChats -- deriving (Show)

instance T.ToJSON TopChatCategory where
 toJSON (TopChatCategoryUsers {  }) =
  A.object [ "@type" A..= T.String "topChatCategoryUsers" ]

 toJSON (TopChatCategoryBots {  }) =
  A.object [ "@type" A..= T.String "topChatCategoryBots" ]

 toJSON (TopChatCategoryGroups {  }) =
  A.object [ "@type" A..= T.String "topChatCategoryGroups" ]

 toJSON (TopChatCategoryChannels {  }) =
  A.object [ "@type" A..= T.String "topChatCategoryChannels" ]

 toJSON (TopChatCategoryInlineBots {  }) =
  A.object [ "@type" A..= T.String "topChatCategoryInlineBots" ]

 toJSON (TopChatCategoryCalls {  }) =
  A.object [ "@type" A..= T.String "topChatCategoryCalls" ]

 toJSON (TopChatCategoryForwardChats {  }) =
  A.object [ "@type" A..= T.String "topChatCategoryForwardChats" ]
-- topChatCategoryUsers TopChatCategory 

-- topChatCategoryBots TopChatCategory 

-- topChatCategoryGroups TopChatCategory 

-- topChatCategoryChannels TopChatCategory 

-- topChatCategoryInlineBots TopChatCategory 

-- topChatCategoryCalls TopChatCategory 

-- topChatCategoryForwardChats TopChatCategory 

