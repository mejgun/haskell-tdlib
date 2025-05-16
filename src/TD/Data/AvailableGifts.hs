module TD.Data.AvailableGifts
  (AvailableGifts(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AvailableGift as AvailableGift

data AvailableGifts
  = AvailableGifts -- ^ Contains a list of gifts that can be sent to another user or channel chat
    { gifts :: Maybe [AvailableGift.AvailableGift] -- ^ The list of gifts
    }
  deriving (Eq, Show)

instance I.ShortShow AvailableGifts where
  shortShow AvailableGifts
    { gifts = gifts_
    }
      = "AvailableGifts"
        ++ I.cc
        [ "gifts" `I.p` gifts_
        ]

instance AT.FromJSON AvailableGifts where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "availableGifts" -> parseAvailableGifts v
      _                -> mempty
    
    where
      parseAvailableGifts :: A.Value -> AT.Parser AvailableGifts
      parseAvailableGifts = A.withObject "AvailableGifts" $ \o -> do
        gifts_ <- o A..:?  "gifts"
        pure $ AvailableGifts
          { gifts = gifts_
          }
  parseJSON _ = mempty

