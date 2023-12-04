module TD.Data.AddedReactions
  (AddedReactions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AddedReaction as AddedReaction
import qualified Data.Text as T

data AddedReactions
  = AddedReactions -- ^ Represents a list of reactions added to a message
    { total_count :: Maybe Int                           -- ^ The total number of found reactions
    , reactions   :: Maybe [AddedReaction.AddedReaction] -- ^ The list of added reactions
    , next_offset :: Maybe T.Text                        -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow AddedReactions where
  shortShow AddedReactions
    { total_count = total_count_
    , reactions   = reactions_
    , next_offset = next_offset_
    }
      = "AddedReactions"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "reactions"   `I.p` reactions_
        , "next_offset" `I.p` next_offset_
        ]

instance AT.FromJSON AddedReactions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "addedReactions" -> parseAddedReactions v
      _                -> mempty
    
    where
      parseAddedReactions :: A.Value -> AT.Parser AddedReactions
      parseAddedReactions = A.withObject "AddedReactions" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        reactions_   <- o A..:?  "reactions"
        next_offset_ <- o A..:?  "next_offset"
        pure $ AddedReactions
          { total_count = total_count_
          , reactions   = reactions_
          , next_offset = next_offset_
          }
  parseJSON _ = mempty

