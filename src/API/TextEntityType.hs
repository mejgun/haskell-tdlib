-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TextEntityType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data TextEntityType = 
 TextEntityTypeMention 
 | TextEntityTypeHashtag 
 | TextEntityTypeCashtag 
 | TextEntityTypeBotCommand 
 | TextEntityTypeUrl 
 | TextEntityTypeEmailAddress 
 | TextEntityTypePhoneNumber 
 | TextEntityTypeBankCardNumber 
 | TextEntityTypeBold 
 | TextEntityTypeItalic 
 | TextEntityTypeUnderline 
 | TextEntityTypeStrikethrough 
 | TextEntityTypeCode 
 | TextEntityTypePre 
 | TextEntityTypePreCode { language :: String }  
 | TextEntityTypeTextUrl { url :: String }  
 | TextEntityTypeMentionName { user_id :: Int }  deriving (Show)

instance T.ToJSON TextEntityType where
 toJSON (TextEntityTypeMention {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeMention" ]

 toJSON (TextEntityTypeHashtag {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeHashtag" ]

 toJSON (TextEntityTypeCashtag {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeCashtag" ]

 toJSON (TextEntityTypeBotCommand {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeBotCommand" ]

 toJSON (TextEntityTypeUrl {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeUrl" ]

 toJSON (TextEntityTypeEmailAddress {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeEmailAddress" ]

 toJSON (TextEntityTypePhoneNumber {  }) =
  A.object [ "@type" A..= T.String "textEntityTypePhoneNumber" ]

 toJSON (TextEntityTypeBankCardNumber {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeBankCardNumber" ]

 toJSON (TextEntityTypeBold {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeBold" ]

 toJSON (TextEntityTypeItalic {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeItalic" ]

 toJSON (TextEntityTypeUnderline {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeUnderline" ]

 toJSON (TextEntityTypeStrikethrough {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeStrikethrough" ]

 toJSON (TextEntityTypeCode {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeCode" ]

 toJSON (TextEntityTypePre {  }) =
  A.object [ "@type" A..= T.String "textEntityTypePre" ]

 toJSON (TextEntityTypePreCode { language = language }) =
  A.object [ "@type" A..= T.String "textEntityTypePreCode", "language" A..= language ]

 toJSON (TextEntityTypeTextUrl { url = url }) =
  A.object [ "@type" A..= T.String "textEntityTypeTextUrl", "url" A..= url ]

 toJSON (TextEntityTypeMentionName { user_id = user_id }) =
  A.object [ "@type" A..= T.String "textEntityTypeMentionName", "user_id" A..= user_id ]

instance T.FromJSON TextEntityType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "textEntityTypeMention" -> parseTextEntityTypeMention v
   "textEntityTypeHashtag" -> parseTextEntityTypeHashtag v
   "textEntityTypeCashtag" -> parseTextEntityTypeCashtag v
   "textEntityTypeBotCommand" -> parseTextEntityTypeBotCommand v
   "textEntityTypeUrl" -> parseTextEntityTypeUrl v
   "textEntityTypeEmailAddress" -> parseTextEntityTypeEmailAddress v
   "textEntityTypePhoneNumber" -> parseTextEntityTypePhoneNumber v
   "textEntityTypeBankCardNumber" -> parseTextEntityTypeBankCardNumber v
   "textEntityTypeBold" -> parseTextEntityTypeBold v
   "textEntityTypeItalic" -> parseTextEntityTypeItalic v
   "textEntityTypeUnderline" -> parseTextEntityTypeUnderline v
   "textEntityTypeStrikethrough" -> parseTextEntityTypeStrikethrough v
   "textEntityTypeCode" -> parseTextEntityTypeCode v
   "textEntityTypePre" -> parseTextEntityTypePre v
   "textEntityTypePreCode" -> parseTextEntityTypePreCode v
   "textEntityTypeTextUrl" -> parseTextEntityTypeTextUrl v
   "textEntityTypeMentionName" -> parseTextEntityTypeMentionName v
   _ -> mempty
  where
   parseTextEntityTypeMention :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypeMention = A.withObject "TextEntityTypeMention" $ \o -> do
    return $ TextEntityTypeMention {  }

   parseTextEntityTypeHashtag :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypeHashtag = A.withObject "TextEntityTypeHashtag" $ \o -> do
    return $ TextEntityTypeHashtag {  }

   parseTextEntityTypeCashtag :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypeCashtag = A.withObject "TextEntityTypeCashtag" $ \o -> do
    return $ TextEntityTypeCashtag {  }

   parseTextEntityTypeBotCommand :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypeBotCommand = A.withObject "TextEntityTypeBotCommand" $ \o -> do
    return $ TextEntityTypeBotCommand {  }

   parseTextEntityTypeUrl :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypeUrl = A.withObject "TextEntityTypeUrl" $ \o -> do
    return $ TextEntityTypeUrl {  }

   parseTextEntityTypeEmailAddress :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypeEmailAddress = A.withObject "TextEntityTypeEmailAddress" $ \o -> do
    return $ TextEntityTypeEmailAddress {  }

   parseTextEntityTypePhoneNumber :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypePhoneNumber = A.withObject "TextEntityTypePhoneNumber" $ \o -> do
    return $ TextEntityTypePhoneNumber {  }

   parseTextEntityTypeBankCardNumber :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypeBankCardNumber = A.withObject "TextEntityTypeBankCardNumber" $ \o -> do
    return $ TextEntityTypeBankCardNumber {  }

   parseTextEntityTypeBold :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypeBold = A.withObject "TextEntityTypeBold" $ \o -> do
    return $ TextEntityTypeBold {  }

   parseTextEntityTypeItalic :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypeItalic = A.withObject "TextEntityTypeItalic" $ \o -> do
    return $ TextEntityTypeItalic {  }

   parseTextEntityTypeUnderline :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypeUnderline = A.withObject "TextEntityTypeUnderline" $ \o -> do
    return $ TextEntityTypeUnderline {  }

   parseTextEntityTypeStrikethrough :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypeStrikethrough = A.withObject "TextEntityTypeStrikethrough" $ \o -> do
    return $ TextEntityTypeStrikethrough {  }

   parseTextEntityTypeCode :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypeCode = A.withObject "TextEntityTypeCode" $ \o -> do
    return $ TextEntityTypeCode {  }

   parseTextEntityTypePre :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypePre = A.withObject "TextEntityTypePre" $ \o -> do
    return $ TextEntityTypePre {  }

   parseTextEntityTypePreCode :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypePreCode = A.withObject "TextEntityTypePreCode" $ \o -> do
    language <- o A..: "language"
    return $ TextEntityTypePreCode { language = language }

   parseTextEntityTypeTextUrl :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypeTextUrl = A.withObject "TextEntityTypeTextUrl" $ \o -> do
    url <- o A..: "url"
    return $ TextEntityTypeTextUrl { url = url }

   parseTextEntityTypeMentionName :: A.Value -> T.Parser TextEntityType
   parseTextEntityTypeMentionName = A.withObject "TextEntityTypeMentionName" $ \o -> do
    user_id <- o A..: "user_id"
    return $ TextEntityTypeMentionName { user_id = user_id }