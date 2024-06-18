module TD.Data.FoundStories
  (FoundStories(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Story as Story
import qualified Data.Text as T

data FoundStories
  = FoundStories -- ^ Contains a list of stories found by a search
    { total_count :: Maybe Int           -- ^ Approximate total number of stories found
    , stories     :: Maybe [Story.Story] -- ^ List of stories
    , next_offset :: Maybe T.Text        -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow FoundStories where
  shortShow FoundStories
    { total_count = total_count_
    , stories     = stories_
    , next_offset = next_offset_
    }
      = "FoundStories"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "stories"     `I.p` stories_
        , "next_offset" `I.p` next_offset_
        ]

instance AT.FromJSON FoundStories where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "foundStories" -> parseFoundStories v
      _              -> mempty
    
    where
      parseFoundStories :: A.Value -> AT.Parser FoundStories
      parseFoundStories = A.withObject "FoundStories" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        stories_     <- o A..:?  "stories"
        next_offset_ <- o A..:?  "next_offset"
        pure $ FoundStories
          { total_count = total_count_
          , stories     = stories_
          , next_offset = next_offset_
          }
  parseJSON _ = mempty

