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



instance T.FromJSON PublicChatType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "publicChatTypeHasUsername" -> parsePublicChatTypeHasUsername v
   "publicChatTypeIsLocationBased" -> parsePublicChatTypeIsLocationBased v
  where
   parsePublicChatTypeHasUsername :: A.Value -> T.Parser PublicChatType
   parsePublicChatTypeHasUsername = A.withObject "PublicChatTypeHasUsername" $ \o -> do
    return $ PublicChatTypeHasUsername {  }

   parsePublicChatTypeIsLocationBased :: A.Value -> T.Parser PublicChatType
   parsePublicChatTypeIsLocationBased = A.withObject "PublicChatTypeIsLocationBased" $ \o -> do
    return $ PublicChatTypeIsLocationBased {  }