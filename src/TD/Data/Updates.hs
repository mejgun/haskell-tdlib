module TD.Data.Updates
  (Updates(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Update as Update

data Updates
  = Updates -- ^ Contains a list of updates
    { updates :: Maybe [Update.Update] -- ^ List of updates
    }
  deriving (Eq, Show)

instance I.ShortShow Updates where
  shortShow Updates
    { updates = updates_
    }
      = "Updates"
        ++ I.cc
        [ "updates" `I.p` updates_
        ]

instance AT.FromJSON Updates where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "updates" -> parseUpdates v
      _         -> mempty
    
    where
      parseUpdates :: A.Value -> AT.Parser Updates
      parseUpdates = A.withObject "Updates" $ \o -> do
        updates_ <- o A..:?  "updates"
        pure $ Updates
          { updates = updates_
          }
  parseJSON _ = mempty

