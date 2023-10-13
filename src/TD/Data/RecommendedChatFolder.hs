module TD.Data.RecommendedChatFolder
  ( RecommendedChatFolder(..)    
  , defaultRecommendedChatFolder 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatFolder as ChatFolder
import qualified Data.Text as T

data RecommendedChatFolder
  = RecommendedChatFolder -- ^ Describes a recommended chat folder
    { folder      :: Maybe ChatFolder.ChatFolder -- ^ The chat folder
    , description :: Maybe T.Text
    }
  deriving (Eq)

instance Show RecommendedChatFolder where
  show RecommendedChatFolder
    { folder      = folder_
    , description = description_
    }
      = "RecommendedChatFolder"
        ++ I.cc
        [ "folder"      `I.p` folder_
        , "description" `I.p` description_
        ]

instance AT.FromJSON RecommendedChatFolder where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "recommendedChatFolder" -> parseRecommendedChatFolder v
      _                       -> mempty
    
    where
      parseRecommendedChatFolder :: A.Value -> AT.Parser RecommendedChatFolder
      parseRecommendedChatFolder = A.withObject "RecommendedChatFolder" $ \o -> do
        folder_      <- o A..:?  "folder"
        description_ <- o A..:?  "description"
        pure $ RecommendedChatFolder
          { folder      = folder_
          , description = description_
          }
  parseJSON _ = mempty

instance AT.ToJSON RecommendedChatFolder where
  toJSON RecommendedChatFolder
    { folder      = folder_
    , description = description_
    }
      = A.object
        [ "@type"       A..= AT.String "recommendedChatFolder"
        , "folder"      A..= folder_
        , "description" A..= description_
        ]

defaultRecommendedChatFolder :: RecommendedChatFolder
defaultRecommendedChatFolder =
  RecommendedChatFolder
    { folder      = Nothing
    , description = Nothing
    }

