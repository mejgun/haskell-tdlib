module TD.Data.FoundAffiliatePrograms
  (FoundAffiliatePrograms(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FoundAffiliateProgram as FoundAffiliateProgram
import qualified Data.Text as T

data FoundAffiliatePrograms
  = FoundAffiliatePrograms -- ^ Represents a list of found affiliate programs
    { total_count :: Maybe Int                                           -- ^ The total number of found affiliate programs
    , programs    :: Maybe [FoundAffiliateProgram.FoundAffiliateProgram] -- ^ The list of affiliate programs
    , next_offset :: Maybe T.Text                                        -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow FoundAffiliatePrograms where
  shortShow FoundAffiliatePrograms
    { total_count = total_count_
    , programs    = programs_
    , next_offset = next_offset_
    }
      = "FoundAffiliatePrograms"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "programs"    `I.p` programs_
        , "next_offset" `I.p` next_offset_
        ]

instance AT.FromJSON FoundAffiliatePrograms where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "foundAffiliatePrograms" -> parseFoundAffiliatePrograms v
      _                        -> mempty
    
    where
      parseFoundAffiliatePrograms :: A.Value -> AT.Parser FoundAffiliatePrograms
      parseFoundAffiliatePrograms = A.withObject "FoundAffiliatePrograms" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        programs_    <- o A..:?  "programs"
        next_offset_ <- o A..:?  "next_offset"
        pure $ FoundAffiliatePrograms
          { total_count = total_count_
          , programs    = programs_
          , next_offset = next_offset_
          }
  parseJSON _ = mempty

