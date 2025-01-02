module TD.Data.ConnectedAffiliatePrograms
  (ConnectedAffiliatePrograms(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ConnectedAffiliateProgram as ConnectedAffiliateProgram
import qualified Data.Text as T

data ConnectedAffiliatePrograms
  = ConnectedAffiliatePrograms -- ^ Represents a list of affiliate programs that were connected to an affiliate
    { total_count :: Maybe Int                                                   -- ^ The total number of affiliate programs that were connected to the affiliate
    , programs    :: Maybe [ConnectedAffiliateProgram.ConnectedAffiliateProgram] -- ^ The list of connected affiliate programs
    , next_offset :: Maybe T.Text                                                -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow ConnectedAffiliatePrograms where
  shortShow ConnectedAffiliatePrograms
    { total_count = total_count_
    , programs    = programs_
    , next_offset = next_offset_
    }
      = "ConnectedAffiliatePrograms"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "programs"    `I.p` programs_
        , "next_offset" `I.p` next_offset_
        ]

instance AT.FromJSON ConnectedAffiliatePrograms where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "connectedAffiliatePrograms" -> parseConnectedAffiliatePrograms v
      _                            -> mempty
    
    where
      parseConnectedAffiliatePrograms :: A.Value -> AT.Parser ConnectedAffiliatePrograms
      parseConnectedAffiliatePrograms = A.withObject "ConnectedAffiliatePrograms" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        programs_    <- o A..:?  "programs"
        next_offset_ <- o A..:?  "next_offset"
        pure $ ConnectedAffiliatePrograms
          { total_count = total_count_
          , programs    = programs_
          , next_offset = next_offset_
          }
  parseJSON _ = mempty

