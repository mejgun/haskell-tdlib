-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PublicChatType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data PublicChatType = 
 PublicChatTypeHasUsername 
 | PublicChatTypeIsLocationBased -- deriving (Show)

instance T.ToJSON PublicChatType where
 toJSON (PublicChatTypeHasUsername {  }) =
  A.object [ "@type" A..= T.String "publicChatTypeHasUsername" ]

 toJSON (PublicChatTypeIsLocationBased {  }) =
  A.object [ "@type" A..= T.String "publicChatTypeIsLocationBased" ]
-- publicChatTypeHasUsername PublicChatType 

-- publicChatTypeIsLocationBased PublicChatType 

