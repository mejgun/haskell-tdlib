module TD.Data.Gifts
  (Gifts(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Gift as Gift

data Gifts
  = Gifts -- ^ Contains a list of gifts that can be sent to another user
    { gifts :: Maybe [Gift.Gift] -- ^ The list of gifts
    }
  deriving (Eq, Show)

instance I.ShortShow Gifts where
  shortShow Gifts
    { gifts = gifts_
    }
      = "Gifts"
        ++ I.cc
        [ "gifts" `I.p` gifts_
        ]

instance AT.FromJSON Gifts where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "gifts" -> parseGifts v
      _       -> mempty
    
    where
      parseGifts :: A.Value -> AT.Parser Gifts
      parseGifts = A.withObject "Gifts" $ \o -> do
        gifts_ <- o A..:?  "gifts"
        pure $ Gifts
          { gifts = gifts_
          }
  parseJSON _ = mempty

