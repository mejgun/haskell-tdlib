module TD.Data.StoryPublicForwards
  (StoryPublicForwards(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoryPublicForward as StoryPublicForward
import qualified Data.Text as T

data StoryPublicForwards
  = StoryPublicForwards -- ^ Represents a list of public forwards and reposts of a story
    { total_count :: Maybe Int                                     -- ^ Approximate total number of messages and stories found
    , forwards    :: Maybe [StoryPublicForward.StoryPublicForward] -- ^ List of found public forwards and reposts
    , next_offset :: Maybe T.Text                                  -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow StoryPublicForwards where
  shortShow StoryPublicForwards
    { total_count = total_count_
    , forwards    = forwards_
    , next_offset = next_offset_
    }
      = "StoryPublicForwards"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "forwards"    `I.p` forwards_
        , "next_offset" `I.p` next_offset_
        ]

instance AT.FromJSON StoryPublicForwards where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyPublicForwards" -> parseStoryPublicForwards v
      _                     -> mempty
    
    where
      parseStoryPublicForwards :: A.Value -> AT.Parser StoryPublicForwards
      parseStoryPublicForwards = A.withObject "StoryPublicForwards" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        forwards_    <- o A..:?  "forwards"
        next_offset_ <- o A..:?  "next_offset"
        pure $ StoryPublicForwards
          { total_count = total_count_
          , forwards    = forwards_
          , next_offset = next_offset_
          }
  parseJSON _ = mempty

