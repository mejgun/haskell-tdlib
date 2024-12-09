module TD.Data.FoundAffiliateProgram
  (FoundAffiliateProgram(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AffiliateProgramInfo as AffiliateProgramInfo

data FoundAffiliateProgram
  = FoundAffiliateProgram -- ^ Describes a found affiliate program
    { bot_user_id :: Maybe Int                                       -- ^ User identifier of the bot created the program
    , parameters  :: Maybe AffiliateProgramInfo.AffiliateProgramInfo -- ^ Information about the affiliate program
    }
  deriving (Eq, Show)

instance I.ShortShow FoundAffiliateProgram where
  shortShow FoundAffiliateProgram
    { bot_user_id = bot_user_id_
    , parameters  = parameters_
    }
      = "FoundAffiliateProgram"
        ++ I.cc
        [ "bot_user_id" `I.p` bot_user_id_
        , "parameters"  `I.p` parameters_
        ]

instance AT.FromJSON FoundAffiliateProgram where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "foundAffiliateProgram" -> parseFoundAffiliateProgram v
      _                       -> mempty
    
    where
      parseFoundAffiliateProgram :: A.Value -> AT.Parser FoundAffiliateProgram
      parseFoundAffiliateProgram = A.withObject "FoundAffiliateProgram" $ \o -> do
        bot_user_id_ <- o A..:?  "bot_user_id"
        parameters_  <- o A..:?  "parameters"
        pure $ FoundAffiliateProgram
          { bot_user_id = bot_user_id_
          , parameters  = parameters_
          }
  parseJSON _ = mempty

