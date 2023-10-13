module TD.Data.Stories
  ( Stories(..)    
  , defaultStories 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Story as Story

data Stories
  = Stories -- ^ Represents a list of stories
    { total_count :: Maybe Int           -- ^ Approximate total number of stories found
    , stories     :: Maybe [Story.Story] -- ^ The list of stories
    }
  deriving (Eq)

instance Show Stories where
  show Stories
    { total_count = total_count_
    , stories     = stories_
    }
      = "Stories"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "stories"     `I.p` stories_
        ]

instance AT.FromJSON Stories where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "stories" -> parseStories v
      _         -> mempty
    
    where
      parseStories :: A.Value -> AT.Parser Stories
      parseStories = A.withObject "Stories" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        stories_     <- o A..:?  "stories"
        pure $ Stories
          { total_count = total_count_
          , stories     = stories_
          }
  parseJSON _ = mempty

instance AT.ToJSON Stories where
  toJSON Stories
    { total_count = total_count_
    , stories     = stories_
    }
      = A.object
        [ "@type"       A..= AT.String "stories"
        , "total_count" A..= total_count_
        , "stories"     A..= stories_
        ]

defaultStories :: Stories
defaultStories =
  Stories
    { total_count = Nothing
    , stories     = Nothing
    }

