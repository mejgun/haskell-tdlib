module TD.Data.PublicForwards
  (PublicForwards(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PublicForward as PublicForward
import qualified Data.Text as T

data PublicForwards
  = PublicForwards -- ^ Represents a list of public forwards and reposts as a story of a message or a story
    { total_count :: Maybe Int                           -- ^ Approximate total number of messages and stories found
    , forwards    :: Maybe [PublicForward.PublicForward] -- ^ List of found public forwards and reposts
    , next_offset :: Maybe T.Text                        -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow PublicForwards where
  shortShow PublicForwards
    { total_count = total_count_
    , forwards    = forwards_
    , next_offset = next_offset_
    }
      = "PublicForwards"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "forwards"    `I.p` forwards_
        , "next_offset" `I.p` next_offset_
        ]

instance AT.FromJSON PublicForwards where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "publicForwards" -> parsePublicForwards v
      _                -> mempty
    
    where
      parsePublicForwards :: A.Value -> AT.Parser PublicForwards
      parsePublicForwards = A.withObject "PublicForwards" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        forwards_    <- o A..:?  "forwards"
        next_offset_ <- o A..:?  "next_offset"
        pure $ PublicForwards
          { total_count = total_count_
          , forwards    = forwards_
          , next_offset = next_offset_
          }
  parseJSON _ = mempty

